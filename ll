<!doctype html><html><head><meta charset=utf8><meta name=viewport content="width=device-width,initial-scale=1,viewport-fit=cover"><style>:root{color-scheme:light;box-sizing:border-box;padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}html{scroll-padding-top:env(safe-area-inset-top,0px)}body{margin:0;padding:0;font:14px -apple-system,BlinkMacSystemFont,sans-serif;background:#faf9f5;color:#141413}img{max-width:100%}[hidden]:not([hidden=until-found i]){display:none!important}</style></head><body>
<title>Autoclik Bug Hunter</title>
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kanit:wght@400;500;600;700;800;900&family=IBM+Plex+Mono:wght@500;600&display=swap" rel="stylesheet">
<style>
  :root{
    --bg:#F6F4EF; --surface:rgba(255,255,255,.82); --surface-2:rgba(33,28,20,.04); --ink:#211C16; --ink-soft:#726B5E;
    --line:rgba(33,28,20,.10); --accent:#FF8A00; --accent-ink:#211C16; --accent-soft:rgba(255,138,0,.16);
    --good:#1F845A; --good-soft:rgba(31,132,90,.13); --warn:#B76E00; --warn-soft:rgba(183,110,0,.14);
    --muted:#6B6B70; --muted-soft:rgba(107,107,112,.10); --insight:#5E5ADB; --insight-soft:rgba(94,90,219,.12);
    --info:#0B66C3; --info-soft:rgba(11,102,195,.12); --fixed:#0E8074; --fixed-soft:rgba(14,128,116,.12);
    --danger:#C9372C; --danger-soft:rgba(201,55,44,.12);
    padding-top:env(safe-area-inset-top,0px); padding-bottom:env(safe-area-inset-bottom,0px);
  }
  @media (prefers-color-scheme: dark){
    :root:not([data-theme="light"]){
      --bg:#18191B; --surface:#232426; --surface-2:#2B2C2F; --ink:#F0F0F1; --ink-soft:#A6A6AC;
      --line:#38393D; --accent:#FFA824; --accent-ink:#1A1A1A; --accent-soft:#3A2E10;
      --good:#3FBE85; --good-soft:#123526; --warn:#E0A83C; --warn-soft:#3A2E10;
      --muted:#96969C; --muted-soft:#303134; --insight:#9997F0; --insight-soft:#26264A;
      --info:#6FB2F0; --info-soft:#132E4A; --fixed:#4FC9BC; --fixed-soft:#0F332E;
      --danger:#FF6B5B; --danger-soft:#3A1B17;
    }
  }
  :root[data-theme="dark"]{
    --bg:#18191B; --surface:#232426; --surface-2:#2B2C2F; --ink:#F0F0F1; --ink-soft:#A6A6AC;
    --line:#38393D; --accent:#FFA824; --accent-ink:#1A1A1A; --accent-soft:#3A2E10;
    --good:#3FBE85; --good-soft:#123526; --warn:#E0A83C; --warn-soft:#3A2E10;
    --muted:#96969C; --muted-soft:#303134; --insight:#9997F0; --insight-soft:#26264A;
    --info:#6FB2F0; --info-soft:#132E4A; --fixed:#4FC9BC; --fixed-soft:#0F332E;
    --danger:#FF6B5B; --danger-soft:#3A1B17;
  }
  :root{
    --radius-sm:8px; --radius-md:12px; --radius-lg:18px; --radius-xl:24px; --radius-pill:999px;
    --shadow-sm:0 1px 3px rgba(33,28,20,.06);
    --shadow-md:0 10px 28px rgba(33,28,20,.09);
    --shadow-lg:0 28px 56px rgba(33,28,20,.14);
    --accent-glow:rgba(255,138,0,.28);
  }
  
  *{box-sizing:border-box;}
  [hidden]{display:none!important;}
  button{appearance:none; -webkit-appearance:none; font:inherit; color:inherit;}
  html{margin:0;background:var(--bg);color:var(--ink); overflow-x:hidden;}
  body{
    margin:0; color:var(--ink);
    font-family:"Kanit",system-ui,-apple-system,sans-serif; font-size:14.5px; line-height:1.55; padding:14px 14px 56px; -webkit-font-smoothing:antialiased;
    background-color:var(--bg); overflow-x:hidden; max-width:100vw;
  }
  img{max-width:100%;}
  h1,h2,h3{font-family:"Kanit",system-ui,sans-serif; font-weight:600; letter-spacing:-.01em; text-wrap:balance; margin:0; color:var(--ink);}
  .mono{font-family:"IBM Plex Mono",monospace; font-variant-numeric:tabular-nums;}
  .wrap{max-width:1180px; margin:0 auto;}
  a{color:var(--accent);}

  .util-bar{display:flex; justify-content:flex-end; gap:8px; flex-wrap:wrap; margin-bottom:10px;}
  .util-group{display:flex; gap:2px; background:var(--surface); border:1px solid var(--line); border-radius:var(--radius-md); padding:3px; box-shadow:none;}
  .util-group button{border:0; background:transparent; color:var(--ink-soft); font-size:12px; font-weight:600; padding:6px 11px; border-radius:8px; cursor:pointer; font-family:"IBM Plex Mono",monospace; transition:background .15s ease, color .15s ease;}
  .util-group button:hover{color:var(--ink); background:var(--surface-2);}
  .util-group button[aria-pressed="true"]{background:var(--accent); color:#fff; box-shadow:none;}

  .emp-profile-bar{display:flex; align-items:center; justify-content:space-between; gap:10px; flex-wrap:wrap; background:var(--surface); border:1px solid var(--line); border-radius:var(--radius-md); padding:12px 14px; margin-bottom:14px; box-shadow:none;}
  .emp-profile-bar span{font-size:13px; color:var(--ink-soft); font-weight:500;}
  .emp-profile-bar span b{color:var(--ink); font-weight:700;}

  .top-nav{display:flex; align-items:center; justify-content:space-between; gap:12px; padding:6px 4px 14px; flex-wrap:wrap;}
  .brand{display:flex; align-items:center; gap:9px;}
  .brand-logo{height:26px; width:auto; display:block; flex:none;}
  .top-nav-right{display:flex; gap:8px; flex-wrap:wrap;}

  .hero-centered{text-align:center; padding:44px 24px 40px;}
  .hero-centered .eyebrow{margin-left:auto; margin-right:auto;}
  .hero-title-gradient{
    font-size:clamp(30px,6vw,46px); font-weight:800; letter-spacing:-.02em;
    background:linear-gradient(180deg, var(--ink) 10%, var(--accent) 160%);
    -webkit-background-clip:text; background-clip:text; color:var(--ink); -webkit-text-fill-color:transparent;
  }
  .hero-centered p{margin:10px auto 0; max-width:52ch;}
  
  .role-nav{display:flex; gap:4px; background:var(--surface-2); border:1px solid var(--line); border-radius:var(--radius-md); padding:4px; margin-bottom:14px; box-shadow:none;}
  .role-nav button{flex:1; border:0; background:transparent; color:var(--ink-soft); font-family:"Kanit",sans-serif; text-transform:none; letter-spacing:0; font-size:13px; font-weight:600; padding:9px 6px; border-radius:8px; cursor:pointer; transition:background .15s ease, color .15s ease, box-shadow .15s ease;}
  .role-nav button:hover{color:var(--ink);}
  .role-nav button[aria-selected="true"]{background:var(--surface); color:var(--accent); box-shadow:var(--shadow-sm); border:1px solid var(--line);}

  .tabs{display:flex; gap:2px; background:var(--surface); border:1px solid var(--line); border-radius:var(--radius-md); padding:4px; margin-bottom:16px; overflow-x:auto; box-shadow:none; -webkit-overflow-scrolling:touch; scrollbar-width:none;}
  .tabs::-webkit-scrollbar{display:none;}
  .tab:hover{color:var(--ink); background:var(--surface-2);}
  .tab[aria-selected="true"]{background:var(--accent-soft); color:var(--warn); box-shadow:none;}
  .tab{flex:1 1 auto; white-space:nowrap; border:0; background:transparent; color:var(--ink-soft); font-family:"Kanit",sans-serif; text-transform:none; letter-spacing:0; font-size:13px; padding:9px 12px; border-radius:8px; cursor:pointer; font-weight:600; transition:background .15s ease, color .15s ease, box-shadow .15s ease;}

  .card{background:var(--surface); border:1px solid var(--line); border-radius:var(--radius-lg); padding:20px; margin-bottom:16px; box-shadow:var(--shadow-sm), inset 0 1px 0 rgba(255,255,255,.6);}
  .card h2{font-size:16px; margin-bottom:4px; letter-spacing:0; font-weight:700;}
  .subtext{color:var(--ink-soft); font-size:13px; margin:0 0 16px;}

  /* Forms & Buttons */
  label{display:block; font-size:13px; font-weight:600; color:var(--ink); margin:0 0 7px;}
  .field{margin-bottom:15px;}
  .row2{display:grid; grid-template-columns:1fr 1fr; gap:14px;}
  .row3{display:grid; grid-template-columns:1fr 1fr 1fr; gap:14px;}
  @media (max-width:640px){.row2,.row3{grid-template-columns:1fr;}}
  
  input[type=text],input[type=url],input[type=date],input[type=tel],textarea,select{
    width:100%; font:inherit; font-size:15px; padding:12px 14px; border-radius:var(--radius-md); border:1px solid var(--line); background:var(--surface); color:var(--ink);
    transition:border-color .15s ease, box-shadow .15s ease;
  }
  input:focus,textarea:focus,select:focus{outline:none; border-color:var(--accent); box-shadow:0 0 0 3px var(--accent-glow);}
  
  .btn{
    border:1px solid transparent; background:var(--accent); color:#fff;
    font-family:"Kanit",sans-serif; text-transform:none; letter-spacing:0; font-weight:600; font-size:15px;
    padding:12px 20px; border-radius:var(--radius-pill); cursor:pointer;
    box-shadow:0 6px 16px rgba(255,138,0,.24);
    transition:all .15s ease;
  }
  .btn:hover{background:#E67A00; box-shadow:0 10px 26px rgba(255,138,0,.34); transform:translateY(-1px);}
  .btn.block{width:100%;}
  .btn.ghost{background:transparent; color:var(--ink); border:1px solid var(--line); box-shadow:none;}

  /* --- NEW IMMERSIVE OVERLAYS FOR ONBOARDING & LOGIN --- */
  .immersive-overlay {
    position: fixed; top: 0; left: 0; right: 0; bottom: 0;
    z-index: 9999;
    background: linear-gradient(180deg, #FFF9F2 0%, #FFEED9 100%);
    overflow-y: auto;
    display: flex; flex-direction: column; align-items: center; justify-content: flex-start;
  }
  /* Abstract bg shapes */
  .immersive-overlay::before, .immersive-overlay::after {
    content:""; position:absolute; border-radius:50%; z-index:0; pointer-events:none;
  }
  .immersive-overlay::before {
    width: 400px; height: 400px; background: rgba(255,188,102,0.2);
    top: 20%; left: -150px; filter: blur(40px);
  }
  .immersive-overlay::after {
    width: 300px; height: 300px; background: rgba(255,160,51,0.15);
    bottom: 10%; right: -100px; filter: blur(40px);
  }
  
  .immersive-content {
    position:relative; z-index:1; width: 100%; max-width: 480px; padding: 30px 20px;
    display: flex; flex-direction: column; min-height: 100vh;
  }

  .onboard-top-logo {
    display: flex; flex-direction: column; align-items: center; margin-bottom: 20px;
  }
  .onboard-top-logo img { height: 40px; margin-bottom:10px; }
  .onboard-top-logo .sub-badge {
    background: #333; color: #fff; padding: 4px 12px; border-radius: 20px;
    font-size: 13px; font-weight: 700; letter-spacing: 0.05em; display:flex; align-items:center; gap:6px;
  }

  .immersive-headline {
    text-align: center; font-size: 38px; font-weight: 900; line-height: 1.1; color: #333;
    margin-bottom: 8px; text-shadow: 0 2px 4px rgba(0,0,0,0.05);
  }
  .immersive-headline.orange { color: var(--accent); }
  .immersive-subhead {
    text-align: center; font-size: 15px; color: #555; font-weight: 500; margin-bottom: 30px;
  }

  .onboard-mascot-container {
    flex: 1; display: flex; justify-content: center; align-items: center; position: relative; margin: 20px 0;
  }
  .onboard-mascot-container img {
    max-height: 380px; width: auto; object-fit: contain; filter: drop-shadow(0 20px 30px rgba(0,0,0,0.15));
  }

  .onboard-footer {
    text-align: center; margin-top: auto; padding-top:20px;
  }
  .onboard-tap-icon { height: 50px; animation: tapPulse 1.5s infinite ease-in-out; margin-bottom:10px;}
  @keyframes tapPulse { 0%,100%{transform:translateY(0) scale(1);} 50%{transform:translateY(-8px) scale(1.05);} }
  
  .onboard-dots { display: flex; justify-content: center; gap: 8px; margin-top: 20px; }
  .onboard-dots span { width: 8px; height: 8px; border-radius: 50%; background: #D9C8B4; transition: 0.3s; }
  .onboard-dots span.is-active { background: var(--accent); width: 24px; border-radius: 12px; }

  /* Login Specifics */
  .login-card {
    background: rgba(255,255,255,0.95); border-radius: 24px; padding: 24px 20px;
    box-shadow: 0 20px 40px rgba(0,0,0,0.08); backdrop-filter: blur(10px);
    margin-top: 10px;
  }
  .login-input-wrap { position: relative; display:flex; align-items:center; }
  .login-input-wrap svg {
    position: absolute; left: 14px; width: 20px; height: 20px; fill: #999; pointer-events: none;
  }
  .login-input-wrap input, .login-input-wrap select {
    padding-left: 44px; border: 1px solid #E5E0D8; border-radius: 12px; background: #FCFBFA;
  }
  .login-btn-gradient {
    background: linear-gradient(90deg, #FF8A00 0%, #FF6A00 100%);
    border: none; color: white; padding: 16px; font-size: 18px; border-radius: 99px;
    box-shadow: 0 8px 20px rgba(255, 110, 0, 0.3); margin-top: 10px; font-weight:700;
  }
  .login-floating-badge {
    position: absolute; bottom: -15px; right: -10px; background: #FFF; padding: 6px 14px;
    border-radius: 20px; font-weight: 700; font-size: 13px; color: #333;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1); transform: rotate(-3deg);
  }
  .login-floating-badge span { color: var(--accent); }

  /* Utilities */
  .status-msg{font-size:13px; margin-top:10px; font-weight:500;}
  .status-msg.ok{color:var(--good);}
  .status-msg.err{color:var(--danger);}
  
  /* Make sure app UI looks decent */
  .progress-track{background:var(--surface-2); border:1px solid var(--line); border-radius:var(--radius-pill); height:10px; overflow:hidden;}
  .progress-fill{background:var(--accent); height:100%; border-radius:var(--radius-pill); transition:width .4s ease;}
  .stat-grid{display:grid; grid-template-columns:repeat(2,1fr); gap:10px;}
  .stat-tile{background:var(--surface); border:1px solid var(--line); border-radius:var(--radius-md); padding:14px 10px; text-align:center;}
  .stat-tile .icon{width:32px; height:32px; border-radius:50%; display:flex; align-items:center; justify-content:center; font-size:14px; margin:0 auto 9px; background:var(--surface-2);}
  .stat-tile .num{font-size:21px; font-weight:700;}
  .stat-tile .lbl{font-size:11px; color:var(--ink-soft);}
</style>

<div class="wrap">
  <!-- Top Nav & Role Nav (Hidden when overlay is active) -->
  <div id="main-nav-container">
    <div class="top-nav">
      <div class="brand"><img class="brand-logo" src="data:image/png;base64,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"#FFF3D6" alt="AUTOCLIK"></div>
      <div class="top-nav-right">
        <div class="util-group" id="theme-group">
          <button type="button" data-theme-choice="light" aria-pressed="false">☀️</button>
          <button type="button" data-theme-choice="dark" aria-pressed="false">🌙</button>
          <button type="button" data-theme-choice="system" aria-pressed="true">🖥</button>
        </div>
        <div class="util-group" id="lang-group">
          <button type="button" data-lang-choice="th" aria-pressed="true">TH</button>
          <button type="button" data-lang-choice="en" aria-pressed="false">EN</button>
        </div>
      </div>
    </div>
    <div class="role-nav" role="tablist" aria-label="role">
      <button id="rolebtn-employee" role="tab" aria-selected="true" data-i18n="roleEmployee"></button>
      <button id="rolebtn-marketing" role="tab" aria-selected="false" data-i18n="roleMarketing"></button>
      <button id="rolebtn-it" role="tab" aria-selected="false" data-i18n="roleIt"></button>
    </div>
  </div>

  <div class="notice-box" id="sync-status-banner" style="display:none; margin:14px;"></div>

  <!-- ================= EMPLOYEE ================= -->
  <div id="role-employee">

    <!-- NEW IMMERSIVE ONBOARDING -->
    <section id="emp-onboarding" class="immersive-overlay">
      <div class="immersive-content">
        <div class="onboard-top-logo">
          <img src="data:image/png;base64,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"#FFF3D6" alt="AUTOCLIK">
          <div class="sub-badge">BUG HUNTER</div>
        </div>
        <h1 class="immersive-headline" id="onboard-caption"></h1>
        <p class="immersive-subhead" id="onboard-hint"></p>
        
        <div class="onboard-mascot-container" id="onboard-card">
           <img class="onboard-sleep-img" id="onboard-mascot-img" src="data:image/webp;base64,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加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飞盘" target="_blank" style="margin: 0px 5px; color: rgb(65, 137, 245); font-family: Helvetica, " Hiragino="" Sans="" GB",="" "Microsoft="" Yahei",="" sans-serif;="" font-size:="" 14px;="" letter-spacing:="" 1px;="" text-align:="" left;="" text-decoration-line:="" none;"="">飞盘"，不仅是近些年来新兴的运动名词，也是不少朋友选择在周末打发时间，锻炼身体的社交活动之一。其实不仅是在今天，很早之前飞盘就已经出现，其历史可追溯至公元前八世纪的古希腊。自其问世以来，它以其独特的形状、出色的性能，深深吸引着人们。

说到底飞盘的本质只是一个圆盘形工具而已，但为何能轻易地在空中划出一道道优美的弧线呢？其实这离不开飞盘中的物理学原理，今天小标就来给大家探究一下“飞盘”中的奥秘吧。
