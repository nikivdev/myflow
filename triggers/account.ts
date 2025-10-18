import { addAccount, setAccount } from "blade/server/auth"
import type { AddTrigger, SetTrigger } from "blade/types"

export const add: AddTrigger = addAccount
export const set: SetTrigger = setAccount as SetTrigger
