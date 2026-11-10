class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261110.204143.6b1de3e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-204143-6b1de3e/marvel-darwin-arm64"
    sha256 "e0996aa83d39dcc81e9ac08423dac7fa1ba45cd6f8c84bc559445d1f344a391f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-204143-6b1de3e/marvel-darwin-amd64"
    sha256 "6477dc4f6ba73f86946e8848407aa24120cd727eb12be9c589eb0c5fe500f05d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-204143-6b1de3e/marvel-linux-arm64"
    sha256 "94f37855afdd733761e37d6b1cbaad5297760e87056142b7b37dbbf08b69c8f3"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-204143-6b1de3e/marvel-linux-amd64"
    sha256 "92bb1ee4c1b63a5748424ee0b7f036524de046fa78e21526643767532bcdacaf"
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
