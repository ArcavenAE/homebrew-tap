class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261007.011414.0274b72"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-011414-0274b72/marvel-darwin-arm64"
    sha256 "7d70ba90642d9d68c98a9532800c9e5849f63d11985c1727d42bb742a0162821"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-011414-0274b72/marvel-darwin-amd64"
    sha256 "1243e0825e1e6ab3fd3278e178ba6260e70916543008adf11d387b59a42ff126"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-011414-0274b72/marvel-linux-arm64"
    sha256 "dd98bafcf071823272980cbb875458f3c3852514904c763c00dc1fc335043a39"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-011414-0274b72/marvel-linux-amd64"
    sha256 "2998e60a3ab61451c6b2c2020880daecdb1baf420b6b28be4fb3ce3cd2c4c41d"
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
