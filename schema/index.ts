export { Account, Session } from "blade/server/auth"
import { link, model, string } from "blade/schema"

export const Member = model({
  slug: "member",

  fields: {
    account: link({
      target: "account",
      actions: {
        onDelete: "CASCADE",
        onUpdate: "CASCADE",
      },
    }),
    space: link({
      required: true,
      target: "space",
      actions: {
        onDelete: "CASCADE",
        onUpdate: "CASCADE",
      },
    }),
  },
})

export const Space = model({
  slug: "space",

  fields: {
    name: string(),
    handle: string({
      unique: true,
    }),
  },
})
