class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261109.050719.e4a7a17"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-050719-e4a7a17/marvel-darwin-arm64"
    sha256 "507cccedc67fa90210ad37abbc6e7f8e3a161d26bb338dd823dfd6f935cf5195"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-050719-e4a7a17/marvel-darwin-amd64"
    sha256 "9d0fff50cb1de636f97d7e3ae30e427a6d101d0bb67d1bc3b409b69365264446"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-050719-e4a7a17/marvel-linux-arm64"
    sha256 "3d45419dc3c1a562a6b7de680071f919946d1ca2595faf0e41d5e4768d3a405c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-050719-e4a7a17/marvel-linux-amd64"
    sha256 "9329e9a4cf835037d3b4b061961ed212d216f3e65bfddbd674121125ce717851"
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
