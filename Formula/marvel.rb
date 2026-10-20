class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261020.024144.cfe0a01"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261020-024145-cfe0a01/marvel-darwin-arm64"
    sha256 "2e5c93ccefbbb5ecfcc31965dd0a220de36d4947a5c99f4ba8eb721969af84af"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261020-024145-cfe0a01/marvel-darwin-amd64"
    sha256 "0f5dc0fe6003cd056531b9438d768177a85a60fab2974ffb3c214390207d232d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261020-024145-cfe0a01/marvel-linux-arm64"
    sha256 "e6bcf98988251b5301fc446eea078346ea7787065f4f81292627377495d99106"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261020-024145-cfe0a01/marvel-linux-amd64"
    sha256 "00ff4fb1e9e0045d86f12b9e83da562ce8343f7e2921abdc1b0e7ea9691f4005"
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
