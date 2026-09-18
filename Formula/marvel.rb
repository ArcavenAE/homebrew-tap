class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260918.013948.ccae937"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260918-013948-ccae937/marvel-darwin-arm64"
    sha256 "4ef57add860cc4b94bcc77322b38de3d106987be24456c26eb4e982dd299104b"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260918-013948-ccae937/marvel-darwin-amd64"
    sha256 "ea059b63fa29f61895069f836a30ad840f13451569bc7ec4e05ae48b6092c5a8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260918-013948-ccae937/marvel-linux-arm64"
    sha256 "306f88f5b34387865e81d1866b306d206be2dd3b953168d943ee1b1694593234"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260918-013948-ccae937/marvel-linux-amd64"
    sha256 "e30f74be7f7f9a7c656ead82cb142071d699a890535654f4dea44abf8948c4c9"
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
