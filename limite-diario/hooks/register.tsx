import { atom, read, update } from 'claude-code'
import type { Register } from 'claude-code'

import type { Limit } from '../types'

const DAY_MS = 24 * 60 * 60 * 1000
const DAYS = 7
const SLICE = 100 / DAYS

const limits = atom({ plugin: 'limite-diario', key: 'limits' } as const, [])

const pct = (n: number) => `${(Math.round(n * 10) / 10).toString().replace('.', ',')}%`

// What is left to spend today: the slices of the days so far, less what the
// week has used, so an unspent day carries over. The surface already prefixes
// the line with the mod's name, "limite-diario".
const statusText = (list: Limit[], at: number) => {
  const one = list.find(limit => limit.kind.startsWith('seven_day'))

  if (!one) {
    return undefined
  }

  const resetsAt = one.resetsAt ? Date.parse(one.resetsAt) : NaN

  if (Number.isNaN(resetsAt) || resetsAt <= at) {
    return pct(SLICE)
  }

  const start = resetsAt - DAYS * DAY_MS
  const today = Math.min(DAYS, Math.max(1, Math.floor((at - start) / DAY_MS) + 1))
  const room = Math.min(100 - one.percentUsed, today * SLICE - one.percentUsed)

  return room > 0 ? pct(room) : `0% (passou ${pct(-room)})`
}

export const register: Register = on => {
  on('session.start', async ($, e, next) => {
    const list: Limit[] = (await $.session.usage()).rateLimits
    await update($, limits, () => list)
    $.ui.status(statusText(list, Date.now()))
    // The day turns without any usage moving, so the line is redrawn on a timer too.
    $.clock.every(60000, async () => $.ui.status(statusText(await read($, limits), Date.now())))

    return next(e)
  })

  on('session.measure', async ($, e, next) => {
    const list: Limit[] = e.rateLimits
    await update($, limits, () => list)
    $.ui.status(statusText(list, Date.now()))

    return next(e)
  })
}
