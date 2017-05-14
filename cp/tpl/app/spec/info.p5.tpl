<div class="l4i-form-group">
  <label>Name/Owner</label>
  <p>{[=it.meta.name]} / {[=it.meta.user]}</p>
</div>

{[? it.description]}
<div class="l4i-form-group">
  <label>Description</label>
  <p>{[=it.description]}</p>
</div>
{[?]}

{[if (it.packages.length > 0) {]}
<div class="l4i-form-group">
  <label>Packages</label>

  <div id="loscp-app-specset-lpmls">
    <table class="table table-hover">
      <thead><tr>
        <th>Name</th>
        <th>Version</th>
        <th>Release</th>
        <th>OS / Arch</th>
        <th>Volume</th>
      </tr></thead>
      <tbody>
      {[~it.packages :v]}
      <tr id="loscp-app-specset-lpmls-name{[=v.name]}">
        <td>{[=v.name]}</td>
        <td>{[=v.version]}</td>
        <td>{[=v.release]}</td>
        <td>{[=v.dist]} / {[=v.arch]}</td>
        <td>/usr/los/{[=v.name]}/{[=v.version]}</td>
      </tr>
      {[~]}
      </tbody>
    </table>
  </div>
</div>
{[}]}

{[if (it.executors.length > 0) {]}
<div class="l4i-form-group">
  <label>Executors</label>

  <div id="loscp-app-specset-executorls">
    {[~it.executors :v]}
    <div class="loscp-app-specset-gn-box">
      <div class="head">
        <span class="title">{[=v.name]}</span>
      </div>
      <div class="body">
        <table width="100%">
          <tr>
            <td width="120">ExecStart</td>
            <td><pre><code class="bash">{[=v.exec_start.trim()]}</code></pre></td>
          </tr>
          {[if (v.exec_stop.trim().length > 0) {]}
          <tr>
            <td>ExecStop</td>
            <td><pre><code class="bash">{[=v.exec_stop.trim()]}</code></pre></td>
          </tr>
          {[}]}
          <!-- <tr>
            <td>Priority</td>
            <td>{[=v.priority]}</td>
          </tr> -->
          <tr>
            <td>Plan</td>
            <td>
              {[if (v.plan.on_boot) {]}
                On Boot
              {[}]}
              {[if (v.plan.on_tick > 0) {]}
                On Tick {[=v.plan.on_tick]}
              {[}]}
          </tr>
        </table>
      </div>
    </div>
    {[~]}
  </div>
</div>
{[}]}

{[if (it.service_ports.length > 0) {]}
<div class="l4i-form-group">
  <label>Service Ports</label>

  <div>
    <table class="table table-hover">
      <thead>
        <tr>
          <th>Name (http,https, ...)</th>
          <th>Box Port</th>
        <tr>
      </thead>
      <tbody>
        {[~it.service_ports :vp]}
        <tr>
          <td>{[=vp.name]}</td>
          <td>{[=vp.box_port]}</td>
        </tr>
        {[~]}
      </tbody>
    </table>
  </div>
</div>
{[}]}

{[if (it._roles.length > 0) {]}
<div class="l4i-form-group">
  <label>Allowed Roles</label>
  <div>
    {[=it._roles.join(", ")]}
  </div>
</div>
{[}]}
