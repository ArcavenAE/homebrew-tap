class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261121.210841.143b29d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261121-210841-143b29d/marvel-darwin-arm64"
    sha256 "8b294e927d64c18bb7f2474672b7d710bfab51b26057868874a7d20a6fd5acd7"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261121-210841-143b29d/marvel-darwin-amd64"
    sha256 "e2614cba7a309e3452f14b65a15d2fbabd577aeb5ddba56e6b501de0f38851f7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261121-210841-143b29d/marvel-linux-arm64"
    sha256 "ade557376288f88bfc06d6a498a68380fce5c48af4e4181993f341a9dd654617"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261121-210841-143b29d/marvel-linux-amd64"
    sha256 "ed2e2399344abe8f2702aaa68bbd56557fcf71a42e59cff4fe3939cddd6d8786"
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
