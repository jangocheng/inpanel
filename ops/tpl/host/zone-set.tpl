<div id="losops-host-zone-form">

  <div id="losops-host-zoneset-alert"></div>

  {[ if (it.meta.id) { ]}
    <input type="hidden" name="id" value="{[=it.meta.id]}">
  {[ } else { ]}
  <div class="l4i-form-group">
    <label class="">Zone</label>
    <div>
      <input type="text" name="id" class="form-control" placeholder="Enter the Zone ID" value="{[=it.meta.id]}"
        {[ if (it.meta.id) { ]}readonly{[ } ]}>
    </div>
  </div>
  {[ } ]}

  <div class="l4i-form-group">
    <label class="">Summary</label>
    <div>
      <input type="text" name="summary" class="form-control" placeholder="Enter the Zone Summary" value="{[=it.summary]}">
    </div>
  </div>

  <div class="l4i-form-group">
    <label>Status</label>
    <div>
      {[~it.statusls :v]}
        <span class="ids-form-checkbox">
          <input type="radio" name="phase" value="{[=v.status]}" {[ if (v.status == it.phase) { ]}checked="checked"{[ } ]}> {[=v.title]}
        </span>
      {[~]}
    </div>
  </div>

  <div class="l4i-form-group">
    <label>
      WAN Addresss
      <button type="button" class="btn btn-default btn-xs" 
        onclick="losOpsHost.ZoneWanAddressAppend()">
        Append new Address
      </button>
    </label>
    <div>
      <table width="100%" class="table">
        <thead>
        <tr>
          <th>Address</th>
          <th></th>
        </tr>
        </thead>
        <tbody id="losops-host-zoneset-wanaddrs">
          {[~it.wan_addrs :vaddr]}
          <tr class="losops-host-zoneset-wanaddr-item">
            <td><input name="wan_addr" type="text" value="{[=vaddr]}" class="input-sm"/></td>
            <td><a href="#" onclick="losOpsHost.ZoneWanAddressDel(this)">Delete</a></td>
          </tr>
          {[~]}
        </tbody>
      </table>
    </div>
  </div>

  <div class="l4i-form-group">
    <label>
      <span>LAN Addresss</span>
      <button type="button" class="btn btn-default btn-xs" 
        onclick="losOpsHost.ZoneLanAddressAppend()">
        Append new Address
      </button>
    </label>
    <div>
      <table width="100%" class="table">
        <thead>
        <tr>
          <th>Address</th>
          <th></th>
        </tr>
        </thead>
        <tbody id="losops-host-zoneset-lanaddrs">
          {[~it.lan_addrs :vaddr]}
          <tr class="losops-host-zoneset-lanaddr-item">
            <td><input name="lan_addr" type="text" value="{[=vaddr]}" class="input-sm"/></td>
            <td><a href="#" onclick="losOpsHost.ZoneLanAddressDel(this)">Delete</a></td>
          </tr>
          {[~]}
        </tbody>
      </table>
    </div>
  </div>

</div>

<script id="losops-host-zoneset-wanaddr-tpl" type="text/html">
<tr class="losops-host-zoneset-wanaddr-item">
  <td><input name="wan_addr" type="text" value="" class="input-sm"/></td>
  <td><a href="#" onclick="losOpsHost.ZoneWanAddressDel(this)">Delete</a></td>
</tr>
</script>

<script id="losops-host-zoneset-lanaddr-tpl" type="text/html">
<tr class="losops-host-zoneset-lanaddr-item">
  <td><input name="lan_addr" type="text" value="" class="input-sm"/></td>
  <td><a href="#" onclick="losOpsHost.ZoneLanAddressDel(this)">Delete</a></td>
</tr>
</script>
