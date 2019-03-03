<style>
#inops-host-zone-form .btn-sm {
  padding: 3px 10px;
  font-size: 12px;
  line-height: 120%;
}
#inops-host-zone-form button.icon-x20 {
  padding: 0px;
  width: 22px;
  height: 22px;
  font-size: 11px;
  text-align: center;
}
#inops-host-zone-form th {
  font-weight: normal;
}
#inops-host-zone-form .card-body {
  padding: 0 10px;
}
<
</style>

<div id="inops-host-zone-form">

  <div id="inops-host-zoneset-alert"></div>

  <table class="incp-formtable valign-middle">
    <tbody>
 
      <tr>
        <td width="260px">Zone ID</td>
        <td width="30px"></td>
        <td>
          <input type="text" name="id" class="form-control" value="{[=it.meta.id]}" {[? it.meta.id.length > 0]}readonly{[?]}>
        </td>
      </tr>

      <tr>
        <td>Summary</td>
        <td></td>
        <td>
          <input type="text" name="summary" class="form-control" placeholder="Enter the Zone Summary" value="{[=it.summary]}">
        </td>
      </tr>
    
      <tr>
        <td>Action</td>
        <td></td>
        <td>
          {[~it._actions :v]}
          <span class="ids-form-checkbox">
            <input type="radio" name="phase" value="{[=v.action]}" {[ if (v.action == it.phase) { ]}checked="checked"{[ } ]}> {[=v.title]}
          </span>
          {[~]}
        </td>
      </tr>
   
      <tr>
        <td>
          LAN Address
        </td>
        <td>
          <button class="btn btn-default icon-x20"
            onclick="inOpsHost.ZoneLanAddressAppend()">
            <i class="fa fa-plus"></i>
          </button>
        </td>
        <td>
          <table width="100%">
            <tbody id="inops-host-zoneset-lanaddrs">
              {[~it.lan_addrs :vaddr]}
              <tr class="inops-host-zoneset-lanaddr-item">
                <td><input name="lan_addr" type="text" value="{[=vaddr]}" class="form-control"/></td>
                <td align="right" width="30px">
                  <button class="btn btn-default icon-x20" onclick="inOpsHost.ZoneLanAddressDel(this)">
                    <i class="fa fa-times"></i>
                  </button>
                </td>
              </tr>
              {[~]}
            </tbody>
          </table>
          <small class="form-text text-muted">example: 192.168.1.1:9529</small>
        </td>
      </tr>
 
      <tr>
        <td>
          WAN Address (Optional)
        </td>
        <td>
          <button class="btn btn-default icon-x20"
            onclick="inOpsHost.ZoneWanAddressAppend()">
            <i class="fa fa-plus"></i>
          </button>
        </td>
        <td>
          <table width="100%">
            <tbody id="inops-host-zoneset-wanaddrs">
              {[~it.wan_addrs :vaddr]}
              <tr class="inops-host-zoneset-wanaddr-item">
                <td><input name="wan_addr" type="text" value="{[=vaddr]}" class="form-control "/></td>
                <td align="right" width="30px">
                  <button class="btn btn-default icon-x20" onclick="inOpsHost.ZoneWanAddressDel(this)">
                    <i class="fa fa-times"></i>
                  </button>
                </td>
              </tr>
              {[~]}
            </tbody>
          </table>
          <small class="form-text text-muted">example: 1.2.3.4:9529</small>
        </td>
      </tr>
   
      {[? inCp.syscfg.zone_master.multi_zone_enable]}
      <tr>
        <td>Cross Region Zone access API</td>
        <td></td>
        <td>
          <input type="text" name="wan_api" class="form-control" placeholder="Enter the Zone API" value="{[=it.wan_api]}">
          <small class="form-text text-muted">example: http://1.2.3.4:9529 or https://example.com</small>
        </td>
      </tr>
      {[?]}
    </tbody>
  </table>
</div>

<script id="inops-host-zoneset-wanaddr-tpl" type="text/html">
<tr class="inops-host-zoneset-wanaddr-item">
  <td><input name="wan_addr" type="text" value="" class="form-control "/></td>
  <td align="right" width="30px">
    <button class="btn btn-default icon-x20" onclick="inOpsHost.ZoneWanAddressDel(this)">
    <i class="fa fa-times"></i>
  </td>
</tr>
</script>

<script id="inops-host-zoneset-lanaddr-tpl" type="text/html">
<tr class="inops-host-zoneset-lanaddr-item">
  <td><input name="lan_addr" type="text" value="" class="form-control "/></td>
  <td align="right" width="30px">
    <button class="btn btn-default icon-x20" onclick="inOpsHost.ZoneLanAddressDel(this)">
    <i class="fa fa-times"></i>
  </td>
</tr>
</script>
