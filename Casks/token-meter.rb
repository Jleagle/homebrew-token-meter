cask "token-meter" do
  version "2.2.4"
  sha256 "cc48f602dd0a33193c7ac7232fd65e7c8d989ff98e0fee53c1ec75bdf682b021"

  url "https://github.com/jleagle/token-meter/releases/download/v#{version}/TokenMeter.zip"
  name "TokenMeter"
  desc "macOS menu bar app for tracking AI usage and quotas (Gemini, Claude Pro, Anthropic API)"
  homepage "https://github.com/jleagle/token-meter"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "TokenMeter.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/TokenMeter.app"]
  end

  # Quits the running copy before the bundle is replaced; on an upgrade Homebrew reopens it afterwards
  uninstall quit: "com.token.meter"

  zap trash: [
    "~/Library/Application Support/TokenMeter",
    "~/Library/Preferences/com.token.meter.plist",
    "~/Library/Preferences/anthropicApiKey.plist",
    "~/Library/Preferences/monthlyBudget.plist",
    "~/Library/Preferences/openAiApiKey.plist",
    "~/Library/Preferences/openAiMonthlyBudget.plist",
    "~/Library/Preferences/toolbarDisplayModelId.plist",
    "~/Library/Preferences/pollingRateSeconds.plist",
  ]
end
