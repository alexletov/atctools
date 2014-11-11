{set layout="main.tpl"}
{set title="About"}
{use class="yii\helpers\Html"}
<div class="site-about">
    <h1>{Html::encode($this->title)}</h1>

    <p>
        This is the About page. You may modify the following file to customize its content:
    </p>

    <code>{$smarty.template}</code>
</div>
