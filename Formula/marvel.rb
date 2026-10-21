class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261021.005825.d0616f9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-005825-d0616f9/marvel-darwin-arm64"
    sha256 "b3b8e4c2e24b01d68a37b61e3671143d2c9f5dc6ac64a650605b3e49a5b7e580"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-005825-d0616f9/marvel-darwin-amd64"
    sha256 "76adb6887d02acc74c14049a4e2cd73cdbbb806b227e615de85e85d108b7e14b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-005825-d0616f9/marvel-linux-arm64"
    sha256 "6c0e6062d527ea20e9f529f4ef816a3ddbf4b7c4416ff76473cd3bd304661788"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-005825-d0616f9/marvel-linux-amd64"
    sha256 "3acb2ee1dadc1c279272b8b8570e6cb9d860d98a49ec1ff38207756323a09f56"
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
