class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260807.153103.15c16b6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-153103-15c16b6/marvel-darwin-arm64"
    sha256 "6b4e16ccc00f6f8315479418dc0571a39b8484a2e189155a730bfa1081d9c619"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-153103-15c16b6/marvel-darwin-amd64"
    sha256 "7a89693038e6ed1cabdc6984c54370cf1f72aed468da62a5c47de6db96d427e2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-153103-15c16b6/marvel-linux-arm64"
    sha256 "ddc0f194676bd7d1337ab12e5518216da0327d9975851934a719947b0425ebd0"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-153103-15c16b6/marvel-linux-amd64"
    sha256 "eedf7f239d4ea86e4c048aae571b5109d2d79945b9aef2f7c4ae0340c4380a08"
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
