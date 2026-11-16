class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261116.223551.8ff2ae6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-223551-8ff2ae6/marvel-darwin-arm64"
    sha256 "2c16b82da82622d6d0caab11713171ed5daa2e383d12a13a612529ffe18655d6"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-223551-8ff2ae6/marvel-darwin-amd64"
    sha256 "9911e73f303f43659401d128d3ffe44e59a9970301df2b9b06673701dc76a849"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-223551-8ff2ae6/marvel-linux-arm64"
    sha256 "bf03f27b91ead1dbecad347b99f570c3343077ab19f69a700453c0489b54fba2"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-223551-8ff2ae6/marvel-linux-amd64"
    sha256 "7bd9b1bf3b4bf9126b1a503a4c9db6914b5b459737d1c70b562654a1b5220d50"
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
