class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.172116.da3565c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-172116-da3565c/marvel-darwin-arm64"
    sha256 "9162b72f430ab428d5c15660fd2fbbeedbdf359277e9886dbbeabb4f72599c07"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-172116-da3565c/marvel-darwin-amd64"
    sha256 "4dee576796879925f46778bfbdacd5e9111ac105aeb4924112fc4989c4d75e82"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-172116-da3565c/marvel-linux-arm64"
    sha256 "2fc41a97dd58cbb1d3fbd80b564a27b864c7c4ffce7fa5bd5ea8c70348799549"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-172116-da3565c/marvel-linux-amd64"
    sha256 "6f873f4bb6e408998e933b2d6a7af7d0a98eaa78994538842e512a0e93e03af0"
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
