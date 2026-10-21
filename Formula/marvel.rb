class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261021.164258.76bacf4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-164258-76bacf4/marvel-darwin-arm64"
    sha256 "2ba90b7c20e45df3d85cb7f8adfe3b64a560972550f3e4f564e75147baf6e517"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-164258-76bacf4/marvel-darwin-amd64"
    sha256 "a5803536f56af997ed201e99f1ab753aeabefb5602cdea10dc4e6a9f75b2b00f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-164258-76bacf4/marvel-linux-arm64"
    sha256 "16f851a6a589b32fff38e946e90cc2f70ab7a24b2a55b77e427bf7693c1d0a51"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-164258-76bacf4/marvel-linux-amd64"
    sha256 "218875fe871767924a427a3af160f619f8552c81812db25ac325250881c10ba5"
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
