<!-- CONTEUDO DA PAGINA -->
        <div class="authentication-page row">

          <div class="col-lg-12 no-padding-left">
        <div id="login-form" class="col-md-offset-2 col-md-8">  
        <div class="row">
                <h1 class="text-center">Login</h1>
        </div>
        <div class="row">
                <form action="{$link->getPageLink('authentication', true)}" method="post" id="login_form" class="std form col-md-12 center-block" role="form">

                  <div class="form-group">
                     <input type="email" id="email" name="email" value="{if isset($smarty.post.email)}{$smarty.post.email|stripslashes}{/if}" class="account_input form-control input-lg"  placeholder="{l s='E-mail address'}" />
                  </div>
                  <div class="form-group">
                  <input type="password" id="passwd" name="passwd" value="{if isset($smarty.post.passwd)}{$smarty.post.passwd|stripslashes}{/if}" class="account_input form-control input-lg" placeholder="{l s='Password'}"/>
                  </div>
                  <div class="form-group">
                    {if isset($back)}<input type="hidden" class="hidden" name="back" value="{$back|escape:'htmlall':'UTF-8'}" />{/if}
                        <input type="submit" id="SubmitLogin" name="SubmitLogin" class="btn-default-1 btn-lg btn-block" value="{l s='Log in'}" />
                    <span class="pull-right"><a href="#" class="register">{l s='Register'}</a></span>
                    <span class="lost_password"><a href="{$link->getPageLink('password')}">{l s='Forgot your password?'}</a</span>

                  </div>
                </form>
          </div>
          <div class="row">
                <div class="col-md-12">
                <button class="btn btn-link btn-lg " onclick="goBack()" >{l s='Cancel'}</button>
            </div>  
          </div>
      </div>
        <div id="regiter-form" class="col-md-offset-2 col-md-8">  
        <div class="row">
                <h1 class="text-center">Login</h1>
        </div>
        <div class="row">
                <form action="{$link->getPageLink('authentication', true)}" method="post" id="login_form" class="std form col-md-12 center-block" role="form">

                  <div class="form-group">
                     <input type="email" id="email" name="email" value="{if isset($smarty.post.email)}{$smarty.post.email|stripslashes}{/if}" class="account_input form-control input-lg"  placeholder="{l s='E-mail address'}" />
                  </div>
                  <div class="form-group">
                  <input type="password" id="passwd" name="passwd" value="{if isset($smarty.post.passwd)}{$smarty.post.passwd|stripslashes}{/if}" class="account_input form-control input-lg" placeholder="{l s='Password'}"/>
                  </div>
                  <div class="form-group">
                    {if isset($back)}<input type="hidden" class="hidden" name="back" value="{$back|escape:'htmlall':'UTF-8'}" />{/if}
                        <input type="submit" id="SubmitLogin" name="SubmitLogin" class="btn-default-1 btn-lg btn-block" value="{l s='Log in'}" />
                    <span class="pull-right"><a href="#" class="register">{l s='Register'}</a></span>
                    <span class="lost_password"><a href="{$link->getPageLink('password')}">{l s='Forgot your password?'}</a</span>

                  </div>
                </form>
          </div>
          <div class="row">
                <div class="col-md-12">
                <button class="btn btn-link btn-lg " onclick="goBack()" >{l s='Cancel'}</button>
            </div>  
          </div>
      </div>
    
          </div>
        </div>

        <!-- FIM CONTEUDO DA PAGINA -->