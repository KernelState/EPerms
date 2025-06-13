import './style.css'

document.getElementById("body")!.innerHTML = `
  <h1 class="title">Welcome</h1>
  <div class="app-card">
    <div class="sub">
      <svg xmlns="http://www.w3.org/2000/svg" class="drop-down-icon" height="23px" viewBox="0 -960 960 960" width="23px"><path d="M504-480 320-664l56-56 240 240-240 240-56-56 184-184Z"/></svg>
      <h4>Name</h4>
    </div>
    <button>Enable</button>
    <h4 class="status-on" style="font-weight: 600;">Enabled</h4>
  </div>
`

