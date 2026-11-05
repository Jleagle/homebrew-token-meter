cask "token-meter" do
  version "2.2.0"
  sha256 "532f299db83bc9c1108890555aeb4fffb7900bbc0e29f39eb700377a0da46726"

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
