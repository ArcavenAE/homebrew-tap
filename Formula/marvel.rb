class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261105.054941.4537f26"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-054941-4537f26/marvel-darwin-arm64"
    sha256 "3cf4deca287601be14910a70fa933123978165f397878179d29ad14fca4a7c8f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-054941-4537f26/marvel-darwin-amd64"
    sha256 "0b2c2ab359fbe22216beef32e1a425f6991bb3201dff937fae4552a842a75d71"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-054941-4537f26/marvel-linux-arm64"
    sha256 "cee14272d14a7e4b08228c025e9ae8fffcf6641576238d75b81e8f240270cb0b"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-054941-4537f26/marvel-linux-amd64"
    sha256 "cad5e3c1a56c011309e6ee5626d705f328021ef97e7bda6e3c4b0bf95b358bea"
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
