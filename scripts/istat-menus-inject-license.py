#!/usr/bin/env python3
"""
iStat Menus License Injection Script

This script takes a sanitized iStat Menus settings file (without license information)
and injects license credentials to create a complete settings file for import.

Usage:
    python3 inject-license.py --input settings.ismp --output licensed-settings.ismp --email "user@example.com" --serial "ABC123-XYZ789"
"""

import plistlib
import argparse
import sys
import os
from pathlib import Path


def validate_file(file_path, should_exist=True):
    """Validate file existence and readability."""
    if should_exist and not os.path.exists(file_path):
        print(f"Error: Input file '{file_path}' does not exist", file=sys.stderr)
        return False

    if should_exist and not os.access(file_path, os.R_OK):
        print(f"Error: Cannot read input file '{file_path}'", file=sys.stderr)
        return False

    return True


def inject_license(input_file, output_file, email, serial, build_version="1240"):
    """
    Inject license information into an iStat Menus settings file.

    Args:
        input_file (str): Path to sanitized .ismp file
        output_file (str): Path for output .ismp file with license
        email (str): License email address
        serial (str): License serial number
        build_version (str): Build version (default from original file)
    """
    try:
        # Read the sanitized plist file
        with open(input_file, 'rb') as f:
            plist_data = plistlib.load(f)

        print(f"Loaded settings from: {input_file}")

        # Inject license information
        plist_data['license'] = {
            'email': email,
            'serial': serial
        }

        # Ensure build version is set
        if 'build' not in plist_data:
            plist_data['build'] = build_version

        # Create output directory if it doesn't exist
        os.makedirs(os.path.dirname(output_file), exist_ok=True)

        # Write the licensed plist file
        with open(output_file, 'wb') as f:
            plistlib.dump(plist_data, f)

        print(f"Licensed settings written to: {output_file}")
        print(f"License injected for: {email}")

        return True

    except plistlib.InvalidFileException:
        print(f"Error: '{input_file}' is not a valid plist file", file=sys.stderr)
        return False
    except Exception as e:
        print(f"Error processing files: {e}", file=sys.stderr)
        return False


def main():
    parser = argparse.ArgumentParser(
        description='Inject license information into iStat Menus settings file',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python3 inject-license.py \\
    --input preferences/istat-menus-settings.ismp \\
    --output /tmp/istat-menus-settings-licensed.ismp \\
    --email "user@example.com" \\
    --serial "GAWQE-FB7NG-YX5VA-8FJ72-WQ6QZ-PNVWR-M8P6R-GLN9C-CUA9F-QZRPL-9PX4H-ENL4G-69HDZ-5FK3D-B5NG7-A"
        """
    )

    parser.add_argument('--input', '-i',
                       required=True,
                       help='Input .ismp file (sanitized, without license)')

    parser.add_argument('--output', '-o',
                       required=True,
                       help='Output .ismp file (with license injected)')

    parser.add_argument('--email', '-e',
                       required=True,
                       help='License email address')

    parser.add_argument('--serial', '-s',
                       required=True,
                       help='License serial number')

    parser.add_argument('--build', '-b',
                       default="1240",
                       help='Build version (default: 1240)')

    parser.add_argument('--verbose', '-v',
                       action='store_true',
                       help='Enable verbose output')

    args = parser.parse_args()

    # Validate inputs
    if not validate_file(args.input, should_exist=True):
        sys.exit(1)

    if not args.email or '@' not in args.email:
        print("Error: Please provide a valid email address", file=sys.stderr)
        sys.exit(1)

    if not args.serial or len(args.serial) < 10:
        print("Error: Please provide a valid serial number", file=sys.stderr)
        sys.exit(1)

    if args.verbose:
        print(f"Input file: {args.input}")
        print(f"Output file: {args.output}")
        print(f"License email: {args.email}")
        print(f"Serial length: {len(args.serial)} characters")
        print(f"Build version: {args.build}")

    # Inject license
    success = inject_license(
        args.input,
        args.output,
        args.email,
        args.serial,
        args.build
    )

    if not success:
        sys.exit(1)

    print("License injection completed successfully!")


if __name__ == '__main__':
    main()
