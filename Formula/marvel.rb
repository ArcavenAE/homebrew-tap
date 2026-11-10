class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261110.215948.90825ad"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-215948-90825ad/marvel-darwin-arm64"
    sha256 "d51ced40e107051c6244d1dd5ab3ccd5d5c604e87f7614e9682b8a87100caf56"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-215948-90825ad/marvel-darwin-amd64"
    sha256 "563c5e994b6fddf0f25684c14cd1bd71c5a0ee8573c263cbb24864cb57b1dcca"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-215948-90825ad/marvel-linux-arm64"
    sha256 "495356952e2a05ecada731c87f17d9d94f04b7108432a5b4fe13d207f11e97d9"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-215948-90825ad/marvel-linux-amd64"
    sha256 "d32d6271e4e4e0f6e4b802e7be84a059e07dbdfedceeaae2a0a436e0401a3d50"
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
