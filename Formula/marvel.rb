class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261120.114348.95ecf74"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-114348-95ecf74/marvel-darwin-arm64"
    sha256 "0bb7eb67300cdf847433f35015d32232894bf3f160a696d9cb370276d6a5a89a"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-114348-95ecf74/marvel-darwin-amd64"
    sha256 "1da2aa0266210be97ae484232875c017b5bff876adf88c36dff73b42c81f66fc"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-114348-95ecf74/marvel-linux-arm64"
    sha256 "374b30541aad50c08dba41f9ed894ae243938901f2908af588181a2855c5969b"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-114348-95ecf74/marvel-linux-amd64"
    sha256 "746908cd89475f6ed6f13bc3f688f4a7278231b9a548d71eb38bf960f8d72524"
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
