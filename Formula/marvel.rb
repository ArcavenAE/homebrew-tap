class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260805.183516.b2f4af3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260805-183516-b2f4af3/marvel-darwin-arm64"
    sha256 "eb1d2742d68cc609cfa216a07e939b3d19eed5936ef5f62a389471f59c0fdb73"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260805-183516-b2f4af3/marvel-darwin-amd64"
    sha256 "c68995dcd60e8400b06649774c6a4b0e14b928eb434396a81b499afa3ba0adc5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260805-183516-b2f4af3/marvel-linux-arm64"
    sha256 "052bf6d79616032fc832bef39388036b6ff754530fe82d4b6a78febbbb4dfda3"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260805-183516-b2f4af3/marvel-linux-amd64"
    sha256 "75ce403c656513d29831ae5dfa948c74239cf621ac0def5c59e13d5f85c5363c"
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
