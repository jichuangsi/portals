<?php

return array(
		'plugin'=>array(
				'title'=>'插件',
				'sons'=>array(
							array(
								'title'=>'砸金蛋日志',
								'sons'=>array(
								        array(
								                'title'=>'参数设置',
								                'link'=>'setting/index',
								                'power'=>[],
								        ),
								        array(
								                'title'=>'用户砸金蛋日志',
								                'link'=>'log/index',
								                'power'=>['delete'],
								        ),
								),
							),
				),
		),
);
