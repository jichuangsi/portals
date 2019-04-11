<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:49:"D:\web\Education\plugins/readjifen/index/read.htm";i:1547520782;}*/ ?>
<script type='text/javascript'>
if("<?php echo $userdb['uid']; ?>"!=''){
    setTimeout(function() {
        $.post("<?php echo purl('readjifen/read/postajax','','index'); ?>", {id: "<?php echo input('id'); ?>"}, function(res) {
            console.log(res);
            if (res.status == 2) {
                layer.msg(res.info, {time: 2500});
            }
        });
    },<?php echo $shijian; ?>);;
}
</script>