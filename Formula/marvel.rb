class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261022.191406.5cd12e5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-191406-5cd12e5/marvel-darwin-arm64"
    sha256 "daa3632f0f2055891a69377d653e015ef6d22b7a9e6d8bafc2f16a9bb56f8047"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-191406-5cd12e5/marvel-darwin-amd64"
    sha256 "9e29576baf5d442fd87154bace7d206545d1f6d24be4b4f24b6001a6d9cd5436"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-191406-5cd12e5/marvel-linux-arm64"
    sha256 "bcca94ed06a2d7e1ca08a401c5122c7968a8356d5fb33472e1472d5235be94be"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-191406-5cd12e5/marvel-linux-amd64"
    sha256 "12cd33f140b1863e3ea755e2bc846eba11afbd3e8d27774f81a8c19ef3d3acf6"
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
