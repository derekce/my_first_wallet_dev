<main class="tab-pane block--container active" ng-if="globalService.currentTab==globalService.tabs.generateWallet.id" ng-controller='walletGenCtrl' role="main" ng-cloak>

  <article class="block__wrap gen__1" ng-show="!wallet && !showGetAddress">

    <section class="block__main gen__1--inner">
      <br />
      <h1 translate="NAV_GenerateWallet" aria-live="polite"> Create New Wallet</h1>
      <h4 translate="GEN_Label_1"> Enter password </h4>
      <div class="input-group">
        <input name="password"
             class="form-control"
             type="{{showPass && 'password' || 'text'}}"
             placeholder="{{'GEN_Placeholder_1' | translate }}"
             ng-model="password"
             ng-class="isStrongPass() ? 'is-valid' : 'is-invalid'"
             aria-label="{{'GEN_Label_1' |translate}}"/>
        <span tabindex="0" aria-label="make password visible" role="button" class="input-group-addon eye" ng-click="showPass=!showPass"></span>
      </div>
      <h4 translate="GEN_Label_Confirm"> Confirm password </h4>
      <div class="input-group" style="display: flex;">
        <input name="confirm_password"
             class="form-control"
             type="password"
             ng-model="confirm_password"
             ng-class="ConfirmPass() ? 'is-valid' : 'is-invalid'"
             aria-label="{{'GEN_Label_1' |translate}}"/>
      </div>
      <a tabindex="0" role="button" class="btn btn-primary" func="generateSingleWallet" ng-click="genNewWallet()" translate="NAV_GenerateWallet">Generate Wallet</a>
      <p translate="x_PasswordDesc"> </p>
      <br>
    </section>

  </article>


  <article role="main" class="block__wrap gen__2" ng-show="wallet && !showPaperWallet" > <!-- -->

    <section class="block__main gen__2--inner">
      <br />
      <h1 translate="GEN_Label_2">Congratulations, you've just created your wallet! </h1>

      <a tabindex="0" role="button"
         class="btn btn-primary"
         href="{{blobEnc}}"
         download="{{encFileName}}"
         aria-label="{{'x_Download'|translate}} {{'x_Keystore'|translate}}"
         aria-describedby="x_KeystoreDesc"
         ng-click="downloaded()"
         target="_blank" rel="noopener">
        <span translate="x_Download"> DOWNLOAD </span> <span translate="x_Keystore2"> Backup File (UTC / JSON) </span>
      </a>

      <div class="warn">
        <!--<p><strong>Do not lose it!</strong> It cannot be recovered if you lose it.</p>-->
        <p><strong>Do not share it!</strong> Your funds will be stolen if you use this file on a malicious/phishing site.</p>
        <p><strong>Make a backup!</strong> Secure it like the millions of dollars it may one day be worth.</p>
      </div>

      <p>
        <a tabindex="0" role="button" class="btn btn-danger" ng-class="fileDownloaded ? '' : 'disabled' " ng-click="continueToPaper()" translate="GET_ConfButton">
          I understand. Continue.
        </a>
      </p>

    </section>

  </article>


  <article role="main" class="block__wrap gen__3" ng-show="showPaperWallet">

    <section class="block__main gen__3--inner">

      <br />

      <h1 translate="GEN_Label_5"> Save your Private Key</h1>
      <input aria-label="{{'x_PrivKey'|translate}}" aria-describedby="x_PrivKeyDesc"
             value="{{wallet.getPrivateKeyString()}}"
             class="form-control"
             type="text"
             readonly="readonly"
             style="max-width: 50rem;margin: auto;"/>

      <br />

      <a tabindex="0" aria-label="{{'x_Print'|translate}}" aria-describedby="x_PrintDesc" role="button" class="btn btn-primary" ng-click="printQRCode()" translate="x_Print">PRINT</a>

      <div class="warn">
        <p><strong>Do not lose it!</strong> It cannot be recovered if you lose it.</p>
        <p><strong>Do not share it!</strong> Your funds will be stolen if you use this file on a malicious/phishing site.</p>
        <p><strong>Make a backup!</strong> Secure it like the millions of dollars it may one day be worth.</p>
      </div>

      <br />

      <a class="btn btn-default btn-sm" ng-click="getAddress()">
        <span translate="GEN_Label_3"> Save your Address </span> →
      </a>

    </section>

  </article>

  <article class="text-left" ng-show="showGetAddress">
    <div class="clearfix collapse-container">
      <div ng-click="wd = !wd">
        <a class="collapse-button"><span ng-show="wd">+</span><span ng-show="!wd">-</span></a>
        <h1 traslate="GEN_Unlock">Unlock your wallet to see your address</h1>
        <p translate="x_AddessDesc"></p>
      </div>
      <div ng-show="!wd">
          @@if (site === 'mew' ) {  <wallet-decrypt-drtv></wallet-decrypt-drtv>         }
          @@if (site === 'cx' )  {  <cx-wallet-decrypt-drtv></cx-wallet-decrypt-drtv>   }
      </div>
    </div>

    <div class="row" ng-show="wallet!=null" ng-controller='viewWalletCtrl'>

      @@if (site === 'cx' ) {  @@include( './viewWalletInfo-content.tpl', { "site": "cx" } )    }
      @@if (site === 'mew') {  @@include( './viewWalletInfo-content.tpl', { "site": "mew" } )   }

    </div>
  </article>

</main>
