if Rails.env.production?
  GoCardless.account_details = {
    :app_id     => 'YGX5KR4N6YV9043JWJH71SWH92G5P9DGVP3GNWCQW1XF5TYZA1RCNBJ2QRYZ2KFK',
    :app_secret => '3FJZHF4MR1ZRNYN53FQ46XBJQ0APE2FHBHR70J8TMZSG8NXTGSG4M7RC1NNKX0Q8',
    :token      => 'R2GAZ1X0EJ3SNC3DSZ3PRN9QTP4B452SAN4T6PZZVJX852TG90NF00HGY8NDZE68 manage_merchant:073GMS1AJM',
  }
else
  GoCardless.environment = :sandbox
  GoCardless.account_details = {
    :app_id     => 'W13kTIr_fojsV3B4c37CenaVooTRrp_wOrWE_QBf3f_P70D54HEqVjfCUaqE1XGu',
    :app_secret => 'NxLeboi0bNjc0mtSvb4VgmYxhyud12XvFmsOZUCLgTGcFAmeK5LjV9HVG4Msnu7k',
    :token      => 'Vf+uZWMaliAHmxFDGJC5MYyuLSWxG0o250a2zA0SPfAVznmVWT+pIoDKkLMi7AIb manage_merchant:0262XFYC2K',
  }
end

