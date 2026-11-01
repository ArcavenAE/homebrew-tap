class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261101.190129.9ab582a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-190129-9ab582a/marvel-darwin-arm64"
    sha256 "6ee659b26996023c6edbe0fac4a3fbe290c55a5ca34b3da86af563d5ae819bc7"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-190129-9ab582a/marvel-darwin-amd64"
    sha256 "8eedf28eb70cd3841463fb594f03143a4b1cb5512d15af6d479b95cf04de1d83"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-190129-9ab582a/marvel-linux-arm64"
    sha256 "9841483a94e59aa2bfa5ddc94238a9d5266705ed1c3b10f482e547c3701da574"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-190129-9ab582a/marvel-linux-amd64"
    sha256 "fc5e734870baecb3aa12b4682a8646263dc0795f54f8c642b7c5139dff916661"
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
