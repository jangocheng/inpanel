<div id="loscp-app-specset-alert" class="alert alert-danger hide"></div>

<div id="loscp-app-specset" style="box-sizing: border-box;">loading</div>

<script id="loscp-app-specset-tpl" type="text/html">
<div class="panel panel-default">
  <div class="panel-heading">{[=it.actionTitle]}</div>
  <div class="panel-body">

    <input type="hidden" name="id" value="{[=it.spec.meta.id]}">


    <div class="l4i-form-group">
      <label>Name</label>
      <p><input name="name" class="form-control" value="{[=it.spec.meta.name]}"></p>
    </div>


    <div class="l4i-form-group">
      <label>Description</label>
      <p><input name="description" class="form-control" value="{[=it.spec.description]}"></p>
    </div>

    <!-- <div class="l4i-form-group">
      <label>Bound Spec Plans (draft)</label>
      <p><input name="draft_bound_plans" class="form-control" value="{[=it.spec.draft_bound_plans]}"></p>
    </div> -->

    <div class="l4i-form-group">
      <label>Packages</label>

      <button class="btn btn-default btn-xs" onclick="losCpAppSpec.SetPackageSelect()">
        <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span> Add Standard Package
      </button>
      <button class="btn btn-default btn-xs hidden">
        <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span> Add Git Repository
      </button>

      <div id="loscp-app-specset-lpmls-msg">no packages yet ...</div>
      <div id="loscp-app-specset-lpmls"></div>
    </div>


    <div class="l4i-form-group">
      <label>Executors</label>

      <button class="btn btn-default btn-xs" onclick="losCpAppSpec.SetExecutorSet()">
        <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span> Create new  Executor
      </button>

      <p id="loscp-app-specset-executorls-msg">no executor yet ...</p>
      <div id="loscp-app-specset-executorls"></div>
    </div>

    <div class="l4i-form-group">

      <label>Service Ports</label>

      <button class="btn btn-default btn-xs" onclick="losCpAppSpec.SetServicePortAppend()">
        <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span> Add new Port
      </button>

      <div>
        <table class="table table-hover">
          <thead>
            <tr>
              <th>Name (http,https, ...)</th>
              <th>Box Port</th>
              {[? it.spec._host_port_enable]}
              <th>Host Port</th>
              {[?]}
              <th></th>
            <tr>
          </thead>
          <tbody id="loscp-app-specset-serviceports">
            {[~it.spec.service_ports :vp]}
            <tr class="loscp-app-specset-serviceport-item">
              <td>
                <input name="sp_name" type="text" value="{[=vp.name]}" class="form-control input-sm" style="width:200px">
              </td>
              <td>
                <input name="sp_box_port" type="text" value="{[=vp.box_port]}" class="form-control input-sm" style="width:200px">
              </td>
              {[? it.spec._host_port_enable]}
              <td>
                <input name="sp_host_port" type="text" value="{[=vp.host_port]}" class="form-control input-sm" style="width:200px">
              </td>
              {[?]}
              <td align="right">
                <button class="btn btn-default btn-xs" onclick="losCpAppSpec.SetServicePortDel(this)">
                  Delete
                </button>
              </td>
            </tr>
            {[~]}
          </tbody>
        </table>
      </div>
    </div>


    <div class="l4i-form-group">
      <label>Allowed Roles</label>
      <div>
        <span style="margin-right:10px">
          <input type="checkbox" name="" value="0" checked="checked" disabled> Owner
        </span>
        {[~it.spec._roles.items :v]}
        <span style="margin-right:10px">
          {[if (v._checked) {]}
          <input type="checkbox" name="roles" value="{[=v.id]}" checked="checked"> {[=v.meta.name]}
          {[} else {]}
          <input type="checkbox" name="roles" value="{[=v.id]}"> {[=v.meta.name]}
          {[}]}
        </span>
        {[~]}
      </div>
    </div>


    <button class="btn btn-primary" onclick="losCpAppSpec.SetCommit()">
      Save
    </button>

    <button class="btn btn-default" onclick="losCpAppSpec.ListRefresh()" style="margin-left:10px">
      Cancel
    </button>
  </div>
</div>
</script>


<script id="loscp-app-specset-lpmls-tpl" type="text/html">
<table class="table table-hover">
  <thead><tr>
    <th>Name</th>
    <th>Version</th>
    <th>Release</th>
    <th>Distribution</th>
    <th>Architecture</th>
    <th>Volume Mount</th>
    <th></th>
  </tr></thead>
  <tbody>
  {[~it :v]}
  <tr id="loscp-app-specset-lpmls-name{[=v.name]}">
    <td>{[=v.name]}</td>
    <td>{[=v.version]}</td>
    <td>{[=v.release]}</td>
    <td>{[=v.dist]}</td>
    <td>{[=v.arch]}</td>
    <td>/usr/los/{[=v.name]}/{[=v.version]}</td>
    <td align="right">
      <button class="btn btn-default btn-xs" onclick="losCpAppSpec.SetPackageRemove('{[=v.name]}')">
        Delete
      </button>
    </td>
  </tr>
  {[~]}
  </tbody>
</table>
</script>

<script id="loscp-app-specset-executorls-tpl" type="text/html">
{[~it :v]}
<div class="loscp-app-specset-gn-box">
  <div class="head">
    <span class="title">{[=v.name]}</span>
    <span class="options">
      <button class="btn btn-default btn-xs" onclick="losCpAppSpec.SetExecutorSet('{[=v.name]}')">
        Setting
      </button>
      <button class="btn btn-default btn-xs" onclick="losCpAppSpec.SetExecutorRemove('{[=v.name]}')">
        Delete
      </button>
    </span>
  </div>
  <div class="body">
    <table width="100%">
      <tr>
        <td width="120">ExecStart</td>
        <td><pre><code class="bash">{[=v.exec_start.trim()]}</code></pre></td>
      </tr>
      <tr>
        <td>ExecStop</td>
        <td><pre><code class="bash">{[=v.exec_stop.trim()]}</code></pre></td>
      </tr>
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
</script>

<script id="loscp-app-specset-serviceport-tpl" type="text/html">
<tr class="loscp-app-specset-serviceport-item">
  <td>
    <input name="sp_name" type="text" value="" class="form-control input-sm" placeholder="Port Name" style="width:200px">
  </td>
  <td>
    <input name="sp_box_port" type="text" value="" class="form-control input-sm" placeholder="Box Port Number 1 ~ 65535" style="width:200px">
  </td>
  {[? it._host_port_enable]}
  <td>
    <input name="sp_host_port" type="text" value="" class="form-control input-sm" placeholder="Host Port Number 1 ~ 1024" style="width:200px">
  </td>
  {[?]}
  <td align="right">
    <button class="btn btn-default btn-xs" onclick="losCpAppSpec.SetServicePortDel(this)">
      Delete
    </button>
  </td>
</tr>
</script>
