<!DOCTYPE html>
{use class="yii\helpers\Html"}
{use class="app\assets\AppAsset"}
{AppAsset::register($this)|void}
{$this->beginPage()|void}
<html lang="{$app->language}">
<head>
    <meta charset="{$app->charset}"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    {Html::csrfMetaTags()}
    <title>{Html::encode($this->title)}</title>
    {$this->head()}
</head>
<body>

{$this->beginBody()}
    <div class="wrap">
        {use class="yii\bootstrap\NavBar" type="block"}
        {NavBar assign='nav' brandLabel='My Company' brandUrl=$app->homeUrl options=['class' => 'navbar-inverse navbar-fixed-top']}
        
        {assign navItems [
                [
                    'label' => 'Home',
                    'url' => {url route='/site/index'}
                ],
                [
                    'label' => 'About',
                    'url' => {url route='/site/about'}
                ],
                [
                    'label' => 'Contact',
                    'url' => {url route='/site/contact'}
                ]
            ]}
        {if $app->user->isGuest}
            {append navItems value=['label' => 'Login', 'url' => {url route='/site/login'}]}            
        {else}
            {append navItems value=['label' => "Logout (`$app->user->identity->username`)",
                            'url' => {url route='/site/logout'},
                            'linkOptions' => ['data-method' => 'post']]}
        {/if}
        
        {use class="yii\bootstrap\Nav" type="block"}
        {Nav
            options=['class' => 'navbar-nav navbar-right']
            items=$navItems
        }
        {/Nav}
        {/NavBar}

        <div class="container">
            {$content}
        </div>
    </div>

    <footer class="footer">
        <div class="container">
            <p class="pull-left">&copy; My Company {date('Y')}</p>
            <p class="pull-right">{Yii::powered()}</p>
        </div>
    </footer>

{$this->endBody()}
</body>
</html>
{$this->endPage()}
