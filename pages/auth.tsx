import { Form, Input } from "blade/components"

export default function Page() {
  return (
    <main className="min-h-screen bg-[#050505] text-[#f5f5f5]">
      <div className="mx-auto grid max-w-[520px] gap-10 px-6 pt-16 pb-24">
        <span className="text-2xl font-semibold tracking-wider">myflow.sh</span>

        <section className="grid gap-10 rounded-3xl border border-white/5 bg-[radial-gradient(circle_at_top,rgba(40,40,40,0.6),rgba(10,10,10,0.92))] p-10 shadow-[0_32px_60px_rgba(0,0,0,0.35)]">
          <header className="grid gap-3">
            <h1 className="text-[2rem]">Welcome back</h1>
            <p className="text-[0.95rem] text-[#cfcfcf]">
              Create a new account or log into your existing one.
            </p>
          </header>

          <div className="grid gap-8">
            <Form model="account">
              <div className="grid gap-4">
                <Input
                  type="text"
                  name="email"
                  placeholder="Email"
                  className="rounded-xl border border-white/10 bg-white/[0.04] px-4 py-3 text-base text-[#f5f5f5] outline-none transition placeholder:text-[#cfcfcf] focus:border-white/30 focus:bg-white/[0.08]"
                />
                <Input
                  type="password"
                  name="password"
                  placeholder="Password"
                  className="rounded-xl border border-white/10 bg-white/[0.04] px-4 py-3 text-base text-[#f5f5f5] outline-none transition placeholder:text-[#cfcfcf] focus:border-white/30 focus:bg-white/[0.08]"
                />
                <button
                  type="submit"
                  className="rounded-full border border-white/20 bg-gradient-to-tr from-white/20 via-white/5 to-white/0 px-5 py-3 text-base font-semibold text-white transition hover:border-white/40 hover:from-white/30 hover:via-white/10"
                >
                  Create Account
                </button>
              </div>
            </Form>

            <Form
              model="session"
              onSuccess={() => {
                console.log("success")
              }}
            >
              <div className="grid gap-4">
                <Input
                  type="text"
                  name="account.email"
                  placeholder="Email"
                  className="rounded-xl border border-white/10 bg-white/[0.04] px-4 py-3 text-base text-[#f5f5f5] outline-none transition placeholder:text-[#cfcfcf] focus:border-white/30 focus:bg-white/[0.08]"
                />
                <Input
                  type="password"
                  name="account.password"
                  placeholder="Password"
                  className="rounded-xl border border-white/10 bg-white/[0.04] px-4 py-3 text-base text-[#f5f5f5] outline-none transition placeholder:text-[#cfcfcf] focus:border-white/30 focus:bg-white/[0.08]"
                />
                <button
                  type="submit"
                  className="rounded-full border border-white/25 bg-transparent px-5 py-3 text-base font-semibold text-[#f5f5f5] transition hover:border-white/40 hover:bg-white/[0.04]"
                >
                  Login
                </button>
              </div>
            </Form>
          </div>
        </section>
      </div>
    </main>
  )
}
