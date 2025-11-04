import { useState, useEffect } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import './App.css'

interface ApiHealthResponse {
  status: string
  message: string
  timestamp: string
}

function App() {
  const [count, setCount] = useState(0)
  const [apiHealth, setApiHealth] = useState<ApiHealthResponse | null>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    fetch('http://localhost:3000/api/v1/health')
      .then(res => res.json())
      .then(data => {
        setApiHealth(data)
        setLoading(false)
      })
      .catch(err => {
        setError(err.message)
        setLoading(false)
      })
  }, [])

  return (
    <>
      <div>
        <a href="https://vite.dev" target="_blank">
          <img src={viteLogo} className="logo" alt="Vite logo" />
        </a>
        <a href="https://react.dev" target="_blank">
          <img src={reactLogo} className="logo react" alt="React logo" />
        </a>
      </div>
      <h1>Vite + React + Rails API</h1>

      <div className="card">
        <h2>API Status</h2>
        {loading && <p>Loading API status...</p>}
        {error && <p style={{ color: 'red' }}>Error: {error}</p>}
        {apiHealth && (
          <div>
            <p style={{ color: 'green' }}>✓ {apiHealth.message}</p>
            <p>Status: {apiHealth.status}</p>
            <p>Timestamp: {new Date(apiHealth.timestamp).toLocaleString()}</p>
          </div>
        )}
      </div>

      <div className="card">
        <button onClick={() => setCount((count) => count + 1)}>
          count is {count}
        </button>
        <p>
          Edit <code>src/App.tsx</code> and save to test HMR
        </p>
      </div>
      <p className="read-the-docs">
        Click on the Vite and React logos to learn more
      </p>
    </>
  )
}

export default App
