class WeekHp < Formula
  desc "Retro health bar in the menu bar that fills up from Monday to Friday"
  homepage "https://github.com/cmaldonadowilson/week-hp-macos"
  url "https://github.com/cmaldonadowilson/week-hp-macos/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "7071b19bd8802c9898e2cc3e0dd55da2af3d96a2da5565b40ccb8048e833f7d1"
  license "GPL-2.0-or-later"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/cmaldonadowilson/homebrew-tap/releases/download/week-hp-1.0.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "86d08474faa7b867ba612a1175685ad478b79fab0d53749ba57de71b9055dd0e"
    sha256 cellar: :any_skip_relocation, sequoia:       "79643be776f1a76f7ea2888b53514d41018a42726fa1c1f4799ea41bd88a6a8c"
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
