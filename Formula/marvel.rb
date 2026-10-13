class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261013.222758.c036540"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261013-222758-c036540/marvel-darwin-arm64"
    sha256 "ba87c53e75bc6f3fb20b7b95277d808b297d66f629dc6a8da043ac3df79b957c"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261013-222758-c036540/marvel-darwin-amd64"
    sha256 "4031b2f42f48d2e3c2ae4fd56a743f63338f29efcc50d43b3ea799da81f6c21d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261013-222758-c036540/marvel-linux-arm64"
    sha256 "1bbdb3f5176d0c63244f786416682133c7de8de2ef5668611207629e73b68709"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261013-222758-c036540/marvel-linux-amd64"
    sha256 "5880493424f744335bf117102cedab043a2b4e3d23d9c85555c7557896cc27cf"
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
