class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261116.012248.6ff17da"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-012248-6ff17da/marvel-darwin-arm64"
    sha256 "65e9e511bb92233b39e087ab6eef0e97dbe00408d62b47155da529bcb6b7647c"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-012248-6ff17da/marvel-darwin-amd64"
    sha256 "18ed59f1cad991e38ef98fa933d65ef5d365d56840c8974ec13a23667850fab6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-012248-6ff17da/marvel-linux-arm64"
    sha256 "999726602ca4eb9f5410db36e37e313c9225a592fadbbea2ce7c37faf3dd7d94"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-012248-6ff17da/marvel-linux-amd64"
    sha256 "e07e08043b63b7aaf8446279fc8e4ffcaae480daf31bd4b5fd502051afc4efb6"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "marvel-linux-arm64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
