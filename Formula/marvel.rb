class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261022.055227.7dde9c4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-055227-7dde9c4/marvel-darwin-arm64"
    sha256 "f2e6972cb7a9400276ab4ba325a8ae0714c08a06274425049041cf7051d934e7"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-055227-7dde9c4/marvel-darwin-amd64"
    sha256 "9336fa5613f7e020a34fc2ef26452902b7ce0b02ab8097b3c64551b75289fe05"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-055227-7dde9c4/marvel-linux-arm64"
    sha256 "42c5fecd8db818e66220d9a0b013e11e9ced3ddbdf428634e19cedacd2bba3e5"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-055227-7dde9c4/marvel-linux-amd64"
    sha256 "7201ca646b9af02b23d87bf6d5b26149d2fe4a92888434eef00ee3df1be6a21a"
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
