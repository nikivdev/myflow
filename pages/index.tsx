import { use } from "blade/server/hooks"
import { Link } from "blade/components"

export default function Page() {
  const session = use.session()
  return (
    <main
      style={{
        backgroundColor: "#000",
        color: "#fff",
        width: "100vw",
        height: "100vh",
        position: "relative",
      }}
    >
      <span
        style={{
          position: "absolute",
          top: "1.5rem",
          left: "1.5rem",
          fontSize: "1.5rem",
          fontWeight: 600,
        }}
      >
        myflow.sh
      </span>
      {!session && (
        <Link
          href="/auth"
          style={{
            position: "absolute",
            top: "1.5rem",
            right: "1.5rem",
            color: "#fff",
            backgroundColor: "transparent",
            border: "1px solid #fff",
            borderRadius: "9999px",
            padding: "0.5rem 1.25rem",
            textDecoration: "none",
            fontWeight: 500,
          }}
        >
          Log In
        </Link>
      )}
    </main>
  )
}
