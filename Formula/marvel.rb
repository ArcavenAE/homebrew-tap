class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260419.063146.45819d9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260419-063146-45819d9/marvel-darwin-arm64"
    sha256 "57e6edf5fec2c2321bb4a24268d316330952f08926a03781da5f79d51141ad53"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260419-063146-45819d9/marvel-darwin-amd64"
    sha256 "9aadd3d7d42936e65d20475183fb03408ca93fd29e8c61915622e7c7cee1b84d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260419-063146-45819d9/marvel-linux-arm64"
    sha256 "7adc71adcd1987c6128b3f90849a4341a61ca044fa59d8d8e0faa556b7303c33"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260419-063146-45819d9/marvel-linux-amd64"
    sha256 "b8524c17a9f1b7c145f8f45432d8c95f998e6c426261b41b8a693e74bac46e31"
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
