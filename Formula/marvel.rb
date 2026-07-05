class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260705.080257.d746504"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260705-080257-d746504/marvel-darwin-arm64"
    sha256 "8ca09f6b69152ad58a4f452941fe8bbe73a89fa59d4f8224a51a2ecd19856d32"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260705-080257-d746504/marvel-darwin-amd64"
    sha256 "b64fb9d6fc41ba70be42ff0b6f0495abd7243d1561a2f5ac7fd6e6566a68d944"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260705-080257-d746504/marvel-linux-arm64"
    sha256 "468241524599296674db1328813e8bf76bae2489a323fa5cb0a9adc69f727098"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260705-080257-d746504/marvel-linux-amd64"
    sha256 "3518a1677aded2569fac1e3d36f7c5794cd8467d324f896f9553227b332ff7af"
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
