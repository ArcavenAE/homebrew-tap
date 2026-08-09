class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260809.033520.0886801"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-033520-0886801/marvel-darwin-arm64"
    sha256 "fdb29ce4d34ac0fe9192994401c98386a8ec77b1b0aed64fb623f08b6d5535f6"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-033520-0886801/marvel-darwin-amd64"
    sha256 "240830212c94e242b26e3a6e86589b066c0189d0f27bff245614e143e2a6d274"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-033520-0886801/marvel-linux-arm64"
    sha256 "e87aa8724844db2035b64b8247adff473f829ecb6c818eaf62340d14463c14c3"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-033520-0886801/marvel-linux-amd64"
    sha256 "417aa44c50b3391d8751468837755761c11c31c7af5681be018f47dece7c44cf"
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
