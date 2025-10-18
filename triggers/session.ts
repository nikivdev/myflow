import type { GetTrigger, AddTrigger, RemoveTrigger } from "blade/types"
import { addSession, getSession, removeSession } from "blade/server/auth"

export const get: GetTrigger = getSession
export const add: AddTrigger = addSession
export const remove: RemoveTrigger = removeSession
