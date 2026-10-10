class WeekHp < Formula
  desc "Retro health bar in the menu bar that fills up from Monday to Friday"
  homepage "https://github.com/cmaldonadowilson/week-hp-macos"
  url "https://github.com/cmaldonadowilson/week-hp-macos/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "9a12c0c21b072ddb9e9c4567f1331f2a9389b1dea88546d60af0c5fac2171c61"
  license "GPL-2.0-or-later"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/cmaldonadowilson/homebrew-tap/releases/download/week-hp-1.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b31fb39977e54f0d3b512961d90a35f29a29f92eaf48aaf2a1803a189c664d24"
    sha256 cellar: :any_skip_relocation, sequoia:       "491a929ad5c29337d3dc592ec788ef765ba45c1c36c17ec0d20f9377ac2fe4f0"
  end

  depends_on macos: :ventura

  uses_from_macos "swift" => :build

  def install
    system "swift", "build", *std_swift_args
    bin.install ".build/release/week-hp"
  end

  def caveats
    <<~EOS
      Week HP lives in the menu bar: if it's full, macOS may hide it behind the notch.
    EOS
  end

  service do
    run opt_bin/"week-hp"
    # Quitting from its menu exits successfully: only restart it after a crash
    keep_alive successful_exit: false
    process_type :interactive
  end

  test do
    assert_equal "week-hp #{version}", shell_output("#{bin}/week-hp --version").strip
    # The text depends on the language and the time of the week
    assert_match(/\d+ ?%|GOAL!|META!|OBJECTIF !/, shell_output("#{bin}/week-hp --print"))
  end
end
