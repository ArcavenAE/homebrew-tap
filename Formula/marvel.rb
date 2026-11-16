class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261116.032007.149d8ac"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-032007-149d8ac/marvel-darwin-arm64"
    sha256 "ac0a695bd7f6ec4ffc5c857805b1b40fd152179c11184ba86c1f232c1e3ab860"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-032007-149d8ac/marvel-darwin-amd64"
    sha256 "30ee2fb34736a18b2f7ed35214cf382e0a2da9bf34e78c649c44531426388f2a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-032007-149d8ac/marvel-linux-arm64"
    sha256 "8018c3e9527b75dc84789d8b78bd1dc54db9b7a3ebfe3ee844772bbcee69b247"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-032007-149d8ac/marvel-linux-amd64"
    sha256 "10844b5f05cc7ea0e440a70917d739ae56db23317e9149e41f921656e48df44b"
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
