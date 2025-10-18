import { use } from "blade/server/hooks"

export default function Page() {
  // const session = use.session()
  // if (!session) return <>Not authorized</>
  const users = use.accounts()

  return (
    <main>
      <h1>Users</h1>
      <table border={1} style={{ borderCollapse: "collapse", width: "100%" }}>
        <thead>
          <tr>
            <th>ID</th>
            <th>Email</th>
            <th>Email Verified</th>
            <th>Verification Token</th>
            <th>Verification Sent At</th>
            <th>Created At</th>
            <th>Updated At</th>
          </tr>
        </thead>
        <tbody>
          {users.map((user) => (
            <tr key={user.id}>
              <td>{user.id}</td>
              <td>{user.email}</td>
              <td>{user.emailVerified ? "Yes" : "No"}</td>
              <td>{user.emailVerificationToken}</td>
              <td>{user.emailVerificationSentAt?.toString()}</td>
              <td>{user.ronin?.createdAt?.toString()}</td>
              <td>{user.ronin?.updatedAt?.toString()}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </main>
  )
}

// TODO: how to hide this page from prod, env?
