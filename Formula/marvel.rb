class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261007.043440.a7c7a34"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-043440-a7c7a34/marvel-darwin-arm64"
    sha256 "d6db122fbb78dc338b0c228a70ffb1aaf303ed56da6ee9e4ffcbae90d3123e54"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-043440-a7c7a34/marvel-darwin-amd64"
    sha256 "806d8560a61c4cce9fd207d47f58d161c616303f2581773d1519cd40092a40d0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-043440-a7c7a34/marvel-linux-arm64"
    sha256 "21efd5c0cff91c62751830d3481506d86eaa7d8ff93574c8cae1f0a99bb19925"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-043440-a7c7a34/marvel-linux-amd64"
    sha256 "c2a090c2b06988be40e869ede40dd121be1738c003d375f434149f7c1523812b"
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
