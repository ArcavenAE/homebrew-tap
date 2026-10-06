class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.185746.6855ac6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-185746-6855ac6/marvel-darwin-arm64"
    sha256 "ca92223c3fcd4f7659a1404a25eff5322c005e30368c9e3afb649a200e32ed40"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-185746-6855ac6/marvel-darwin-amd64"
    sha256 "fec8f357a76791727f0dcbb2ecdd8fb48ee0a18e135294c25a97a337b3fdfa1b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-185746-6855ac6/marvel-linux-arm64"
    sha256 "2e6411074b309536317eff6ce79d211ddea439150b8b7b050dcf79be4e27c6b6"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-185746-6855ac6/marvel-linux-amd64"
    sha256 "e2ca7b5278102d32ed313f15b5b040a68484b8c88a2d14f9667ae4e2664e566a"
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
