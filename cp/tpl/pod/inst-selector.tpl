<table class="table table-hover">
  <thead>
    <tr>
      <th>Pod ID</th>
      <th>Name</th>
      <th>Location</th>
      <th>Action</th>
      <th></th>
    </tr>
  </thead>

  <tbody id="loscp-podls-selector"></tbody>
</table>

<div id="loscp-podls-selector-alert" class="alert"></div>

<script id="loscp-podls-selector-tpl" type="text/html">
{[~it.items :v]}
<tr>
  <td class="loscp-font-fixspace">{[=v.meta.id]}</td>
  <td style="width:30%;">{[=v.meta.name]}</td>
  <td>{[=v.spec.zone]}/{[=v.spec.cell]}</td>
  <td>{[=losCp.OpActionTitle(v.operate.action)]}</td>
  <td align="right">
    <buttona class="btn btn-default btn-xs" onclick="_loscp_podls_selector_pod('{[=v.meta.id]}')">Select</a>
  </td>
</tr>
{[~]}
</script>

<script type="text/javascript">

function _loscp_podls_selector_pod(id)
{
    if (l4iModal.CurOptions.fn_selector) {
        l4iModal.CurOptions.fn_selector(null, id);
    }
}

losCpPod.List("loscp-podls-selector");

</script>
