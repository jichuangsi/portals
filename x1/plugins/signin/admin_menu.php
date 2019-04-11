<?php

return array(
		'plugin'=>array(
				'title'=>'插件',
				'sons'=>array(
							array(
								'title'=>'会员签到管理',
								'sons'=>array(
								        array(
								                'title'=>'参数设置',
								                'link'=>'setting/index',
								                'power'=>[],
								        ),
								        array(
								                'title'=>'签到用户列表',
								                'link'=>'log/index',
								                'power'=>['delete'],
								        ),
								),
							),
				),
		),
);
