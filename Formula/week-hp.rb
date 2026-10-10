class WeekHp < Formula
  desc "Retro health bar in the menu bar that fills up from Monday to Friday"
  homepage "https://github.com/cmaldonadowilson/week-hp-macos"
  url "https://github.com/cmaldonadowilson/week-hp-macos/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "5772a09b7bca5c1b6606ee1c1ca0184654d6879615459dcc45f0cfe89431734a"
  license "GPL-2.0-or-later"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/cmaldonadowilson/homebrew-tap/releases/download/week-hp-1.3.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b281e44f531c9d6a1ecb514b4cbe34809661dab92c62e2f7ec7d083ac9852515"
    sha256 cellar: :any_skip_relocation, sequoia:       "934941ffc777ebec934292bb9b005ace2a6f650cfcf584a5720f3b86389dad9c"
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
